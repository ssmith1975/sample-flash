package com.ssmith1975.gallery {
	// Stores Image Data
	 
	 public class Image {
		 
		private var _name:String;
		private var _file:String;
		private var _thumb:String;
		
		public function Image(name:String, file:String, thumb:String) {
			_name = name;
			_file = file;
			_thumb = thumb;
		}
		
		public function get name():String {
			return _name;
		}
		
		public function get file():String {
			return _file;
		}
		
		public function get thumb():String {
			return _thumb;
		}
		
	 }
	
}