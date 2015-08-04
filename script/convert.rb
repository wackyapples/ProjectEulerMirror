require 'nokogiri'
require 'pp'

# Generate the checking script
def gen_check(md5)
  # noinspection RubyQuotedStringsInspection
  %{
<script type="text/javascript" src="md5.min.js"></script>

<script type="text/javascript">
   function check_ans(ans) {
      if (md5(ans) === "#{md5}") {
         alert("Correct!");
      } else {
         alert("Sorry, that is incorrect!");
      };
   };
</script>}
end

# Raw HTML for the new form
check_form = %{
   Answer: <input type="text" name="answer" id="answer" style="border:1px solid #999;width:100px;"/>
   <button onclick="check_ans(document.getElementById('answer').value);">Check</button>}

no_answer = 'Answer not yet available'

# Extract known answer hashes (source: http://kmkeen.com/local-euler/project_euler.txt )
md5s = open('project_euler.txt') { |f| f.grep(/Answer:/) }

md5s.map! do |f|
  f.delete('Answer:').strip
end

# Pre downloaded wget mirror
Dir.chdir('../projecteuler.net')
prob_files = Dir['problem=*']

# md5s.each_with_index do |md5, idx|
prob_files.each_index do |idx|
  # Get the MD5 sum of the answer if it exists yet
  md5 = md5s.length >= idx ? md5s[idx] : '?'

  # Problems start at 1, Ruby arrays start at 0
  prob = idx+1

  # Open the file and read as a string
  prob_file = File.open('problem='+prob.to_s+'.html')
  probstr = prob_file.read

  # Escape the pesky stray '<' symbols
  probstr.gsub!(/<(?=[^!<>]*<)/, '&lt;')

  # Open the HTML w/ Nokogiri
  prob_html = Nokogiri::HTML(probstr)

  # The old answer check form
  ans_form = prob_html.at_css('form')

  # If an answer exists, add the checking form and script
  if md5 != '?'
    # Add answer checking script
    prob_html.at_css('head').add_child gen_check(md5)

    # prob_html.at_css('form').parent.content=check_form

    # Replace the old checking form with the new one
    ans_form.replace check_form
  else
    # Remove focus JS
    ans_form.parent.next_sibling.remove

    # Replace form with a no answer notice
    ans_form.replace no_answer
  end

  # Write the new file, nuking the old one (if one exists)
  nf = File.new('../mirror/problem='+prob.to_s+'.html', 'w+')
  nf.write prob_html.to_html
  # Close the open files
  nf.close
  prob_file.close

end