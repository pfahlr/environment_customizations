const { execSync } = require('child_process');


selectionToGradient = function(text) {
  //return "blah"+text+"blah";
  var result = runFilter(text, 'gradientbox');
  return result;
}

runFilter = function(text, design) {
  //return "blah"+text+"blah";
  var command = getFilter(text,design);
  //return command;
  var result = "";
  result = execSync(command);
  return result.toString();
}

getFilter = function(text,design) {
  var command = "echo \""+text+"\" | boxes -d "+design+" -p h1 -s 80 -i none -n UTF-8"
  return command;
}


module.exports = { selectionToGradient };


