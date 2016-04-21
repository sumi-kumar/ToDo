// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
// $.completeTask = function(){
//  $(".task-check").bind('click', function(){
// 	 $(this).closest("form").submit();
// 	});

// }
// $.completeTask();

 $.completeTask = $('parent-task-check :checkbox').on('click', function () {
    var $chk = $(this),
        $parent-task-check = $chk.closest('parent-task-check'),
        $parent-task-check, $parent;
    if ($parent-task-check.has('child-task-check')) {
        $parent-task-check.find(':checkbox').not(this).prop('checked', this.checked)
    }
    do {
        $child-task-check = $parent-task-check.parent();
        $parent = $child-task-check.siblings(':checkbox');
        if ($chk.is(':checked')) {
            $parent.prop('checked', $child-task-check.has(':checkbox:not(:checked)').length == 0)
        } else {
            $parent.prop('checked', false)
        }
        $chk = $parent;
        $child-task-check = $chk.closest('parent-task-check');
    } while ($child-task-check.is(':not(.someclass)'));
});
$.completeTask();


