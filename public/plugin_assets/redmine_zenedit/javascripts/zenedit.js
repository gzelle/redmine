function jsZenEdit(textArea, options) {
  if (!document.createElement) { return; }

  if (!textArea) { return; }

  if ((typeof(document["selection"]) == "undefined")
  && (typeof(textArea["setSelectionRange"]) == "undefined")) {
    return;
  }

  this.options = options || {};
  this.title = this.options['title'] || 'Zen';
  this.$textArea = $(textArea);
  this.$textArea.attr('placeholder', this.options['placeholder']);

  var $jstEditor = this.$textArea.parent('.jstEditor');
  this.$jstEditor = $jstEditor;

  var $jstBlock = $jstEditor.parent();
  this.$toolBar = $jstBlock.find('.jstElements');

  var that = this;

  // Add the theme button
  var $themeButton = $('<button type="button" tabindex="200" class="jstb_zenedit theme"></button>');
  $themeButton.attr('title', this.title);
  $jstEditor.append($themeButton);
  $themeButton.on('click', function () {
    try {
      $jstEditor.toggleClass('dark-theme');
      that.$textArea.focus();
    } catch (e) {}
    return false;
  });

  this.addZenButton();

  // Add listener for "escape" key
  document.onkeydown = function (evt) {
    evt = evt || window.event;
    if (evt.keyCode == 27) {
      var $jstElements = $('.jstElements.zen').removeClass('zen');
      $jstElements.removeAttr("style");

      var $jstEditor = $('.jstEditor.zen');
      $jstEditor.removeClass('zen');

      var $textArea = $jstEditor.find('textarea');
      $textArea.removeAttr("style");
      $textArea.focus();

      $('html.zen').removeClass('zen');
      $('#zenPreview').remove();
    }
  };
}
