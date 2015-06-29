/*!
 * Start Bootstrap - Creative Bootstrap Theme (http://startbootstrap.com)
 * Code licensed under the Apache License v2.0.
 * For details, see http://www.apache.org/licenses/LICENSE-2.0.
 */
(function($) {
    "use strict"; // Start of use strict
    $(document).ready(function(){
      $('.navbar-collapse ul li a').click(function() {
          $('.navbar-toggle:visible').click();
      });
    })

    // Initialize WOW.js Scrolling Animations
    new WOW().init();

})(jQuery); // End of use strict
