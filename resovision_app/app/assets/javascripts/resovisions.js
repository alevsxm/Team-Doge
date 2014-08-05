// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
  console.log("JS for Resovisions");

  $('body').on('click', '.resovision-info', editInfo );

  $('body').on('keypress', '.edit-description', function(event){
      var editInput = $(this);
      if (event.which === 13) {
        updateInfo.call(this);
      }
    });

    

});

function editInfo() {
  var resovisionInfoDiv = $(this);
  var resovisionElementArray = resovisionInfoDiv.children();

  // resovisionElementArray.each

  for (var i = 0; i < resovisionElementArray.length; i++) {
    if (resovisionElementArray.eq(i).hasClass('resovision-element')) {
      var editID = resovisionElementArray.eq(i).attr('id');
      var editSpan = $('<span class="edit" id="' + editID + '">');
      var editInput = $('<input type="text" class="edit-description">');
      var text = resovisionElementArray.eq(i).text();

      editSpan.append(editInput);
      editInput.val(text);
      resovisionElementArray.eq(i).replaceWith(editSpan);
    }
  }
}

function updateInfo() {
  var editInput = $(this);
  var editSpan = editInput.parent();

  var newFirstName = editSpan.parent().find('#first_name').children().val();
  var newLastName = editSpan.parent().find('#last_name').children().val();
  var newLocation = editSpan.parent().find('#location').children().val();
  var newIndustry = editSpan.parent().find('#industry').children().val();
  var newSummary = editSpan.parent().find('#summary').children().val();
  var newHeadline = editSpan.parent().find('#headline').children().val();



  var resovisionID = editInput.parent().parent().data('id');
  var editSpanArray = editInput.parent().parent().children();



  var params = { resovision: { first_name: newFirstName, last_name: newLastName,
                               location: newLocation, industry: newIndustry,
                               summary: newSummary, headline: newHeadline }};

  $.ajax('/resovisions/' + resovisionID, { type: "PUT", data: params })
    .done(function(data) {
      for (var i = 0; i < editSpanArray.length; i++) {
        if (editSpanArray.eq(i).hasClass('edit')) {
          var inputID = editSpanArray.eq(i).attr('id');
          var newDiv = $('<h4 class="resovision-element" id="'+ inputID +'">');
          editSpanArray.eq(i).replaceWith(newDiv);
          newDiv.text(data[inputID]);
        }
      }
    });
}









//
