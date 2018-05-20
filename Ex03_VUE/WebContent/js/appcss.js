new Vue({
	el: '#vue-app',
	data: {
		available:false,
		nearby: false
	},
	methods:{
		greet: function(time){
			//this.data.name
			//this.name
			return 'Good ' + time + ' ' +this.name;	
		}
	},
	computed:{
		compClasses: function(){
			return{
				available: this.available,
				nearby: this.nearby
			}
		}
	}
});
