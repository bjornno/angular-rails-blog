LocationService = ($q, $rootScope, ReverseGeolocationService) ->

  locate = () ->
    defer = $q.defer()
    navigator.geolocation.getCurrentPosition(
      (position) ->
        console.log("bar")
        ReverseGeolocationService.findAddress(
          position.coords.latitude,
          position.coords.longitude
        ).then (address) ->
          position = {coords: position.coords}
          position.address = address
          defer.resolve(position)
      ,
      (error) ->
        defer.reject(error)
    )
    defer.promise

  {locate: locate}

LocationService.$inject = ["$q", "$rootScope", "ReverseGeolocationService"]
angular.module('Blog').factory("LocationService", LocationService)