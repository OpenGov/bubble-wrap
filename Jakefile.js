/*global desc, task, jake, fail, complete */
"use strict";

desc("Build and test");
task("default", ["lint", "test"]);

desc("Lint all the things");
task("lint", [], function() {
    var lint = require("./build/lint/lint_runner.js");
    var files = new jake.FileList();
    files.include("**/*.js");
    files.exclude("node_modules");
    files.exclude("spikes");
    files.exclude("test");

    var passed = lint.validateFileList(files.toArray(), nodeLintOptions(), {} );
    if (!passed) fail("Lint failed");
});

desc("Test everything");
task("test", [], function() {
    var Mocha = require("mocha");
    var mocha = new Mocha({reporter: 'min'});
    mocha.addFile('./test/sample.js');
    mocha.run(function(failures) {
        if (failures) fail("Tests Failed");
    });
});

function nodeLintOptions() {
    return {
        bitwise: true,
        curly: false,
        eqeqeq: true,
        forin: true,
        immed: true,
        latedef: false,
        newcap: true,
        noarg: true,
        noempty: true,
        nonew: true,
        regexp: true,
        undef: true,
        strict: true,
        trailing: true,
        node: true
    };
}