/**
 * myGeolocation Directive
 * @namespace Directives
 */
(function() {
  'use strict';

  angular.module('starter.directives', [])
    .directive('myGeolocation', myGeolocation);

  /**
   * @namespace myGeolocation
   * @desc Shows the current geolocation
   * @memberOf Directives
   */
  function myGeolocation() {
    var directive = {
      templateUrl: 'templates/geolocation.html',
      restrict: 'EA',
      link: link,
      controller: GeolocationController,
      controllerAs: 'vm',
      bindToController: true
    };
    return directive;

    function link(scope, el, attr, vm) {
      /**/
    }
  }

  GeolocationController.$inject = ['geolocationService'];

  /**
   * @namespace myGeolocation
   * @desc Geolocation logic
   * @memberOf Directives
   */
  function GeolocationController(geolocationService) {
    var vm = this;

    vm.currentPosition = {};
    vm.loading = false;
    vm.updateGeolocation = updateGeolocation;

    updateGeolocation();

    ////////////

    /**
     * @name updateBookList
     * @desc update currentPosition
     * @returns {Array}
     * @memberOf Directives.myBookList
     */
    function updateGeolocation(){
      vm.loading = true;

      return geolocationService.getPosition()
        .then(function(coords){
          vm.currentPosition = coords;
          return vm.currentPosition;
        })
        .finally(function(){
          vm.loading = false;
        });
    }
  }

})();
