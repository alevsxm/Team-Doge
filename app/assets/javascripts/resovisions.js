
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function () {
    $('.show-ziglet').on('click', function(){
    
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,'');
    var showVideoButton = $(this)
    $('div.player').remove();
    $('button.show-ziglet').show();
    showVideoButton.hide();
    var showPlayer= '<div class="player"><ziggeo ziggeo-video=\'_' + videoKey + '\' ziggeo-width=550 ziggeo-height=450></ziggeo><button id="close-player">Close Player</button></div>';
    $(showPlayer).appendTo(zigletDiv);
    $('#close-player').on('click', function() {
      var playerDiv = $(this).parent();
      console.log(playerDiv);
      playerDiv.remove();
      showVideoButton.show();
    });
  });

  $('.record-ziglet').on('click', function(){
    var zigletDiv = $(this).parent();
    var buttonID = (this.id);
    var videoKey = buttonID.replace(/ /g,''); 
    var recordVideoButton = $(this); 
     $('div.recorder').remove();
     $('button.record-ziglet').show();
    recordVideoButton.hide(); 
    try {
      var oldVideo = ZiggeoApi.Videos.get('_'+ videoKey);
      var oldVideoToken = oldVideo.token; 
      var oldVideoTokenLength = oldVideoToken.length; 
      var newRecorder = '<div class="recorder"><div id="replace-me"</div><button id="close-player">Close Player</button></div>';
      ZiggeoApi.Embed.embed("#replace-me", {video: oldVideoToken};
      $(newRecorder).appendTo(zigletDiv);

    } catch (e) {
      var newRecorder = '<div class="recorder"><ziggeo id="ziglet-recorder" ziggeo-width=420 ziggeo-height=340 ziggeo-key=\'' + videoKey + '\' ziggeo-limit=120></ziggeo><button id="close-recorder">Close Recorder</button></div>';
      $(newRecorder).appendTo(zigletDiv);
    }    
    $('#close-recorder').on('click', function() {
      var recorderDiv = $(this).parent();
      recorderDiv.remove();
      recordVideoButton.show();
    });
  });

  // Resovision:
  $('body').on('click', '.resovision-info', editInfo );
  $('body').on('keypress', '.edit-description', function(event){
    var editInput = $(this);
    if (event.which === 13) {
      updateInfo.call(this);
    }
  });

  // Positions:
  $('body').on('click', '.position', editPosition );
  $('body').on('keypress', '.edit-pos-description', function(event){
    var editInput = $(this);
    if (event.which === 13) {
      updatePosition.call(this);
    }
  });

  // Educations:
  $('body').on('click', '.education', editEducation );
  $('body').on('keypress', '.edit-edu-description', function(event){
    var editInput = $(this);
    if (event.which === 13) {
      updateEducation.call(this);
    }
  });


});

function editInfo() {
  var resovisionInfoDiv = $(this);
  var resovisionElementArray = resovisionInfoDiv.children();

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
  var resovisionID = editInput.parent().parent().data('id');
  var editSpanArray = editInput.parent().parent().children();

  var newFirstName = editSpan.parent().find('#first_name').children().val();
  var newLastName = editSpan.parent().find('#last_name').children().val();
  var newLocation = editSpan.parent().find('#location').children().val();
  var newIndustry = editSpan.parent().find('#industry').children().val();
  var newSummary = editSpan.parent().find('#summary').children().val();
  var newHeadline = editSpan.parent().find('#headline').children().val();

  var params = { resovision: { first_name: newFirstName, last_name: newLastName,
                               location: newLocation, industry: newIndustry,
                               summary: newSummary, headline: newHeadline }};

  $.ajax('/resovisions/' + resovisionID, { type: "PUT", data: params })
    .done(function(data) {
      for (var i = 0; i < editSpanArray.length; i++) {
        if (editSpanArray.eq(i).hasClass('edit')) {
          var inputID = editSpanArray.eq(i).attr('id');
          var newDiv = $('<li class="resovision-element" id="'+ inputID +'">');
          editSpanArray.eq(i).replaceWith(newDiv);
          newDiv.text(data[inputID]);
        }
      }
    });
}

function editPosition() {
  var indPosDiv= $(this);
  var posElsArray = indPosDiv.children();
  for (var i = 0; i < posElsArray.length; i++) {
    if (posElsArray.eq(i).hasClass('position-element')) {
      var editID = posElsArray.eq(i).attr('id');
      var editSpan = $('<span class="edit" id="' + editID + '">');
      var editInput = $('<input type="text" class="edit-pos-description">');
      var text = posElsArray.eq(i).text();

      editSpan.append(editInput);
      editInput.val(text);
      posElsArray.eq(i).replaceWith(editSpan);
    }
  }
}

function updatePosition() {
  var editInput = $(this);
  var editSpan = editInput.parent();
  var positionID = editInput.parent().parent().attr('id');
  var editSpanArray = editSpan.parent().children();

  var newCompanyName = editSpan.parent().find('#company').children().val();
  var newTitle = editSpan.parent().find('#title').children().val();
  var newSummary = editSpan.parent().find('#summary').children().val();
  var newStartMonth = editSpan.parent().find('#start-month').children().val();
  var newStartYear = editSpan.parent().find('#start-year').children().val();
  var newEndMonth = editSpan.parent().find('#end-month').children().val();
  var newEndYear = editSpan.parent().find('#end-year').children().val();

  var params = { position: { company_name: newCompanyName, title: newTitle,
                               summary: newSummary, start_month: newStartMonth,
                               start_year: newStartYear, end_month: newEndMonth,
                               end_year: newEndYear }};

  console.log('updating position: ' + positionID);
  $.ajax('/positions/' + positionID, { type: "PUT", data: params })
    .done(function(data) {
      console.log('position ' + positionID + ' updated.');
      for (var i = 0; i < editSpanArray.length; i++) {
        if (editSpanArray.eq(i).hasClass('edit')) {
          var inputID = editSpanArray.eq(i).attr('id');
          // console.log(inputID);
          var newDiv = $('<li class="position-element" id="'+ inputID +'">');
          // console.log(newDiv);
          editSpanArray.eq(i).replaceWith(newDiv);
          newDiv.text(data[inputID]);

        }
      }
    });
}

function editEducation() {
  var indEduDiv= $(this);
  var eduElsArray = indEduDiv.children();
  for (var i = 0; i < eduElsArray.length; i++) {
    if (eduElsArray.eq(i).hasClass('education-element')) {
      var editID = eduElsArray.eq(i).attr('id');
      var editSpan = $('<span class="edit" id="' + editID + '">');
      var editInput = $('<input type="text" class="edit-edu-description">');
      var text = eduElsArray.eq(i).text();
      editSpan.append(editInput);
      editInput.val(text);
      eduElsArray.eq(i).replaceWith(editSpan);
    }
  }
}

function updateEducation() {
console.log("Update started");

  var editInput = $(this);
  var editSpan = editInput.parent();
  var educationID = editInput.parent().parent().attr('id');
  var editSpanArray = editSpan.parent().children();

  var newSchoolName = editSpan.parent().find('#school_name').children().val();
  var newDegree = editSpan.parent().find('#degree').children().val();
  var newFieldOfStudy = editSpan.parent().find('#field_of_study').children().val();
  var newStartYear = editSpan.parent().find('#start_year').children().val();
  var newEndYear = editSpan.parent().find('#end_year').children().val();

  var params = { education: { school_name: newSchoolName, degree: newDegree,
                            field_of_study: newFieldOfStudy,
                            start_year: newStartYear, end_year: newEndYear
  }};

console.log('Updating education: ' + educationID);
  $.ajax('/educations/' + educationID, { type: "PUT", data: params })
    .done(function(data) {
console.log('Update in progress for: education ' + educationID);
      for (var i = 0; i < editSpanArray.length; i++) {
        if (editSpanArray.eq(i).hasClass('edit')) {
          var inputID = editSpanArray.eq(i).attr('id');
          var newDiv = $('<li class="education-element" id="'+ inputID +'">');
          editSpanArray.eq(i).replaceWith(newDiv);
          newDiv.text(data[inputID]);
        }
      }
    });
console.log("Update completed");
}





//
