LocationService = ($q, $rootScope, ReverseGeolocationService) ->

  deg2rads = (degrees)->
    degrees * (Math.PI / 180)

  # R is Radius of earch. Defaults to km. Pass in the radius in miles to get distance in miles
  distanceBetweenPoints = (lat1, lon1, lat2, lon2, R=6371)->
    Math.acos(Math.sin(deg2rads(lat1))*Math.sin(deg2rads(lat2)) +
    Math.cos(deg2rads(lat1))*Math.cos(deg2rads(lat2)) *
    Math.cos(deg2rads(lon2)-deg2rads(lon1))) * R


  locate = () ->
    defer = $q.defer()
    navigator.geolocation.getCurrentPosition(
      (position) ->
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

  {locate: locate, distanceBetweenPoints: distanceBetweenPoints}

LocationService.$inject = ["$q", "$rootScope", "ReverseGeolocationService"]
angular.module('Blog').factory("LocationService", LocationService)