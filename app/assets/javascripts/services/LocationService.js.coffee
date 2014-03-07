LocationService = ($q, $rootScope, ReverseGeolocationService) ->

  distance = (lat1, long1, lat2, long2) ->
    R = 6371 # km
    dLat = (lat2 - lat1).toRad()
    dLon = (lon2 - lon1).toRad()
    lat1 = lat1.toRad()
    lat2 = lat2.toRad()
    a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    d = R * c
    d

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

  {
    locate: locate,
    distance: distance
  }

LocationService.$inject = ["$q", "$rootScope", "ReverseGeolocationService"]
angular.module('Blog').factory("LocationService", LocationService)