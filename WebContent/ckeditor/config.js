/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	config.toolbarGroups = [
	                		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
	                		{ name: 'clipboard', groups: [ 'undo', 'clipboard' ] },
	                		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
	                		{ name: 'document', groups: [ 'doctools', 'document', 'mode' ] },
	                		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
	                		{ name: 'links', groups: [ 'links' ] },
	                		{ name: 'styles', groups: [ 'styles' ] },
	                		{ name: 'colors', groups: [ 'colors' ] },
	                		{ name: 'insert', groups: [ 'insert' ] },
	                		{ name: 'about', groups: [ 'about' ] },
	                		{ name: 'tools', groups: [ 'tools' ] },
	                		{ name: 'forms', groups: [ 'forms' ] },
	                		{ name: 'others', groups: [ 'others' ] }
	                	];

config.removeButtons = 'Cut,Copy,Paste,PasteText,PasteFromWord,Find,Replace,SelectAll,Scayt,Source,Templates,NewPage,Preview,Language,BidiRtl,BidiLtr';
config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html';
config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?type=Images';
config.filebrowserFlashBrowseUrl = 'ckfinder/ckfinder.html?type=Flash';
config.filebrowserUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
config.filebrowserImageUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
config.filebrowserFlashUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';

};
