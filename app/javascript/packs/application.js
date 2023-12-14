// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import $ from 'jquery';

// import 'jquery-ujs'; // Assuming you have a jquery-ujs package installed
// import 'turbolinks'; // Remove this line
// import 'channels';   // Remove this line


$(document).ready(function() {
  console.log('jQuery is ready!');
  $('.role-checkboxes').on('click', function() {
    updateDropdownValue();
  });

// document.addEventListener('turbolinks:load', function() {
//   debugger
//   console.log('hello');
//   $('.role-checkboxes').on('change', function() {
//     debugger
//     updateDropdownValue();
//   });

  function updateDropdownValue() {
    let selectedCheckboxes = $('.role-checkboxes:checked').map(function() {
      return this.value;
    }).get();
    // let selectedCheckboxes = event.target.innerHTML

    $.ajax({
      url: '/default_role',
      data: { selected_value: selectedCheckboxes },
      type: 'GET',
      success: function(result){
        let business_type = $("#body-dropdown")

        business_type.empty();
        if (result.length > 1) {
          business_type.append('<option value="">Please Select</option>');
        }
        
        result.forEach(function(item){
          business_type.append(`<option value=${item.role_name}>${item.role_name}</option>`);
        });
      }
    });
  }
});



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
