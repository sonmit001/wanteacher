new Vue({
	el: '#vue-app',
	data: {
		age: 25,
		x:0,
		y:0,
		a:0,
		b:0
	},
	methods :{
		add: function(inc){
			console.log('add')
			this.age +=inc;
		},
		subtract: function(dec){
			this.age -=dec;
		},
		updatexy: function(event){
			this.x = event.offsetX;
			this.y = event.offsetY;
		},
		click: function(){
			alert('you clicked me');
		},
/*		
 *  둘 중 어느 버튼을 눌러도 둘다 함수를 부르는 역할을 한다.
 *  그래서 console에 두개가 동시에 다 찍힌다.
 * 		addtoa: function(){
			console.log('addtoa')
			return this.a + this.age;
		},
		addtob : function(){
			console.log('addtob')
			return this.b + this.age;
		}*/
	},
	computed:{
		//내가 필요 할때만 불러 올 수 가 있다.
		addtoa: function(){
			console.log('addtoa')
			return this.a + this.age;
		},
		addtob : function(){
			console.log('addtob')
			return this.b + this.age;
		}
	}
});
