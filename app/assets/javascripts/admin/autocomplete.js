$(function() {

  var attachAutocompletes = function() {
    $.each($('select'), function(index, select) {
      var combobox = $('<input/>'),
          hidden = $('<input/>', { type: 'hidden', name: $(select).attr('name') }),
          currentValue = $(select).find(':selected').text();
      options = $.map(select, function(option) {
        return {
          label: option.label,
          value: option.value
        }
      });
      combobox.autocomplete({
        source: $.map(options, function(option) { return option.label }),
        select: function(event, ui) {
          var id;
          $.each(options, function(index, option) {
            if (option.label == ui.item.label) {
              id = option.value;
            }
          });
          hidden.val(id);
        }
      });
      if (currentValue) {
        combobox.val(currentValue);
      }
      combobox.insertAfter(select);
      hidden.insertAfter(select);
      $(select).remove();
    });
  };

  $('.drink_ingredients > a.button').on('click', function() {
    attachAutocompletes();
  });
  attachAutocompletes();
});
