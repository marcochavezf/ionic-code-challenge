/**
 * GeolocationService Factory
 * @namespace Factories
 */
(function(){
  'use strict';

  angular.module('starter.services', ['ngCordova'])
    .factory('geolocationService', geolocationService);

  geolocationService.$inject = ['$cordovaGeolocation', '$log'];

  /**
   * @namespace geolocationService
   * @desc Retrieves geolocation
   * @memberOf Factories
   */
  function geolocationService($cordovaGeolocation, $log){

    var service = {
      getPosition: getPosition
    };

    return service;

    ////////////

    /**
     * @name getPosition
     * @desc Get current position from cordova plugin
     * @returns {Object} coords containing {latitude} and {longitude}
     * @memberOf Factories.GeolocationService
     */
    function getPosition() {
      var posOptions = {timeout: 10000, enableHighAccuracy: true};
      return $cordovaGeolocation
        .getCurrentPosition(posOptions)
        .then(getPositionSuccessful)
        .catch(getPositionFailed);

      function getPositionSuccessful(position) {
        return position.coords;
      }

      function getPositionFailed(error) {
        $log.error('Failed to get gps position.' + error.data);
      }

    }

  }

})();
