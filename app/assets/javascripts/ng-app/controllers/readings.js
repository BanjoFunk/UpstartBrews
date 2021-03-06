angular.module('AngularUpstart')
  .controller('ReadingsCtrl', ['$scope', '$http', 'Ability', 'Alert', function($scope, $http, Ability, Alert) {

    $scope.$watch('details_category', function(newValue, oldValue) {
      if(newValue == "readings"){
        $http.get('/api/batches/' + $scope.selected_batch.id + '/batch_readings')
          .success(function(data, status, headers, config) {
            $scope.selected_batch.batch_readings = data;
          })
      }
    });

    $scope.newReading = function(reading){
      $http.post('/api/batches/' + $scope.selected_batch.id + '/batch_readings', {
        ph: reading.ph,
        brix: reading.brix,
        temp: reading.temp,
        batch_id: $scope.selected_batch.id
      }).
        success(function(data, status, headers, config) {
          $('.new_reading').val('');
          $scope.selected_batch.batch_readings.push(data)
        }).
        error(function(data, status, headers, config) {
          Alert.add("danger", 'sorry, you are not authorized to create new readings', 4000);
        });
    }

    $scope.showEdit = true;
    $scope.editReading = function(reading) {
      $http.put('/api/batches/' + $scope.selected_batch.id + '/batch_readings/' + reading.id, {
        ph: reading.ph,
        brix: reading.brix,
        temp: reading.temp,
        reading_date: reading.reading_date
      }).
        success(function(data, status, headers, config) {
          return true
        }).
        error(function(data, status, headers, config) {
          Alert.add("danger", 'sorry, you are not authorized to edit readings', 4000);
        });

    }

    $scope.removeReading = function(reading_id){
      $http.delete('/api/batches/' + $scope.selected_batch.id + '/batch_readings/' + reading_id, {}).
        success(function(data, status, headers, config) {
          $scope.selected_batch.batch_readings.pop(data)
        }).
        error(function(data, status, headers, config) {
          Alert.add("danger", 'sorry, you are not authorized to delete readings', 4000);
        });
    }

  }]);