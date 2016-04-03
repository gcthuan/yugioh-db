var yugiohDb = angular.module("yugiohDb", ["ui.router", "templates", "ui.bootstrap", "infinite-scroll", "Devise", "angular-loading-bar"]);

yugiohDb.config(["$stateProvider", "$locationProvider", "$urlRouterProvider", function ($stateProvider, $locationProvider, $urlRouterProvider) {
	$stateProvider.state('home', {
		url: '/',
		templateUrl: 'home/_home.html',
		controller: 'MainCtrl',
		resolve: {
			popularCards: ['cards', function (cards) {
				return cards.getPopular();
			}],
			popularSets: ['sets', function (sets) {
				return sets.getPopular();
			}],
			randomCard: ['cards', function (cards) {
				return cards.getRandom();
			}]
		}
	})
	.state('card', {
		url: '/cards/{id}',
		templateUrl: 'cards/_card.html',
		controller: 'CardsCtrl',
		resolve: {
			card: ['$stateParams', 'cards', function ($stateParams, cards) {
				return cards.getOne($stateParams.id);
			}]
		}
	})
	.state('browseCards', {
		url: '/cards',
		templateUrl: 'cards/_browseCards.html',
		controller: 'BrowseCardsCtrl',
		resolve: {
			browseCards: ['cards', function (cards) {
				return cards.getAll();
			}]
		}
	})
	.state('set', {
		url: '/card_sets/{id}',
		templateUrl: 'sets/_set.html',
		controller: 'SetsCtrl',
		resolve: {
			set: ['$stateParams', 'sets', function ($stateParams, sets) {
				return sets.getOne($stateParams.id);
			}]
		}
	})
	.state('browseSets', {
		url: '/card_sets',
		templateUrl: 'sets/_browseSets.html',
		controller: 'BrowseSetsCtrl',
		resolve: {
			browseSets: ['sets', function (sets) {
				return sets.getAll();
			}]
		}
	})
	.state('find', {
		url: '/find',
		templateUrl: 'find/_find.html',
		controller: 'FindCtrl',
	})
	.state('login', {
		url: '/login',
		templateUrl: 'auth/_login.html',
		controller: 'AuthCtrl',
		onEnter: ['$state', 'Auth', function ($state, Auth) {
			Auth.currentUser().then(function () {
				$state.go('home');
			});
		}]
	})
	.state('register', {
		url: '/register',
		templateUrl: 'auth/_register.html',
		controller: 'AuthCtrl',
		onEnter: ['$state', 'Auth', function ($state, Auth) {
			Auth.currentUser().then(function () {
				$state.go('home');
			});
		}]
	});
	$locationProvider.html5Mode(true);
	$urlRouterProvider.otherwise('/');
}]);