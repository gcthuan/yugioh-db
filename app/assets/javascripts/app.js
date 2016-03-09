var yugiohDb = angular.module("yugiohDb", ["ui.router", "templates", "ui.bootstrap"]);

yugiohDb.config(["$stateProvider", "$locationProvider", "$urlRouterProvider", function($stateProvider, $locationProvider, $urlRouterProvider) {
	$stateProvider.state('home', {
		url: '/',
		templateUrl: 'home/_home.html',
		controller: 'MainCtrl'
	})
	.state('card', {
		url: '/cards/{id}',
		templateUrl: 'cards/_card.html',
		controller: 'CardCtrl'
	});
	$locationProvider.html5Mode(true);
	// $urlRouterProvider.otherwise('home');
}]);