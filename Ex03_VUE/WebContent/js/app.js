new Vue({
	el: '#vue-app',
	data: {
		name: 'myungsoo',
		job: 'actor',
		website : 'https://www.naver.com/',
		websitetag: '<a href="https://www.naver.com/">Go naver</a>'
	},
	methods:{
		greet: function(time){
			//this.data.name
			//this.name
			return 'Good ' + time + ' ' +this.name;	
		}
	}
});
