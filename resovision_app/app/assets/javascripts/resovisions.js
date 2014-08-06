
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {

  $('body').on('click', '.resovision-info', editInfo );

  $('body').on('keypress', '.edit-description', function(event){
      var editInput = $(this);
      if (event.which === 13) {
        updateInfo.call(this);
      }
    });

  $('.show-ziglet').on('click', function(){
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,'');
    var showVideoButton = $(this) 
    showVideoButton.hide();
    var showPlayer= '<button id="close-player">Close Player<ziggeo ziggeo-video=\'_' + videoKey + '\' ziggeo-width=550 ziggeo-height=450></ziggeo></button>';
    $(showPlayer).appendTo(zigletDiv);
    $('#close-player').on('click', function() {
      var closeButton = $(this);   
      console.log(closeButton);
      $(this).remove(); 
      showVideoButton.show();
    }); 
  });

  

  $('.record-ziglet').on('click', function(){
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,'');
    var recordVideoButton = $(this) 
    recordVideoButton.hide(); 
    var newRecorder = '<button id="close-recorder">Close Recorder<ziggeo id="ziglet-recorder" ziggeo-width=420 ziggeo-height=340 ziggeo-key=\'' + videoKey + '\' ziggeo-limit=120></ziggeo></button>'; 
    $(newRecorder).appendTo(zigletDiv);
    $('#close-recorder').on('click', function() {
      var closeButton = $(this);   
      console.log(closeButton);
      $(this).remove(); 
      recordVideoButton.show();
    }); 
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
