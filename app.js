// Get the remote and folder from the user
var inquirer = require('inquirer');

// Prepare question objects
var remote = {
    type: 'input',
    name: 'remote',
    message: 'Enter remote: '
};

var folder = {
    type: 'input',
    name: 'folder',
    message: 'Enter remote folder: '
};

// Ask the user for the inputs
inquirer.prompt([remote, folder], function (answers) {
    console.log(answers);
    // require('child_process').spawn('./script.sh', [answers.remote, answers.folder]);
    console.log(answers.remote + ':' + answers.folder);
});
