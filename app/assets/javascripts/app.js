var yugiohDb = angular.module("yugiohDb", ["ui.router", "templates", "ui.bootstrap", "infinite-scroll"]);

yugiohDb.config(["$stateProvider", "$locationProvider", "$urlRouterProvider", function($stateProvider, $locationProvider, $urlRouterProvider) {
	$stateProvider.state('home', {
		url: '/',
		templateUrl: 'home/_home.html',
		controller: 'MainCtrl',
		resolve: {
			popularCards: ['cards', function(cards) {
				return cards.getPopular();
			}],
			popularSets: ['sets', function(sets) {
				return sets.getPopular();
			}],
			randomCard: ['cards', function(cards) {
				return cards.getRandom();
			}]
		}
	})
	.state('cards', {
		url: '/cards/{id}',
		templateUrl: 'cards/_cards.html',
		controller: 'CardsCtrl',
		resolve: {
			card: ['$stateParams', 'cards', function($stateParams, cards) {
				return cards.getOne($stateParams.id);
			}]
		}
	})
	.state('sets', {
		url: '/card_sets/{id}',
		templateUrl: 'sets/_sets.html',
		controller: 'SetsCtrl',
		resolve: {
			set: ['$stateParams', 'sets', function($stateParams, sets) {
				return sets.getOne($stateParams.id);
			}]
		}
	})
	.state('find', {
		url: '/find',
		templateUrl: 'find/_find.html',
		controller: 'FindCtrl',
	});
	$locationProvider.html5Mode(true);
	// $urlRouterProvider.otherwise('/');
}]);