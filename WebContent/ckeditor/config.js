/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.md or
 *          http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	config.toolbarGroups = [ {
		name : 'document',
		groups : [ 'mode', 'document', 'doctools' ]
	}, {
		name : 'clipboard',
		groups : [ 'clipboard', 'undo' ]
	}, {
		name : 'editing',
		groups : [ 'find', 'selection', 'spellchecker', 'editing' ]
	}, {
		name : 'forms',
		groups : [ 'forms' ]
	}, {
		name : 'insert',
		groups : [ 'insert' ]
	}, {
		name : 'styles',
		groups : [ 'styles' ]
	}, {
		name : 'colors',
		groups : [ 'colors' ]
	}, {
		name : 'basicstyles',
		groups : [ 'basicstyles', 'cleanup' ]
	}, {
		name : 'paragraph',
		groups : [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ]
	}, {
		name : 'links',
		groups : [ 'links' ]
	}, '/', {
		name : 'tools',
		groups : [ 'tools' ]
	}, {
		name : 'others',
		groups : [ 'others' ]
	}, {
		name : 'about',
		groups : [ 'about' ]
	} ];

	config.removeButtons = 'Source,Save,Templates,Cut,Paste,Copy,PasteText,PasteFromWord,Undo,Redo,NewPage,Preview,Print,Find,Replace,SelectAll,Scayt,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Strike,RemoveFormat,Outdent,Indent,Blockquote,CreateDiv,BidiLtr,BidiRtl,Language,Anchor,Flash,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,Youtube,Font,Styles,BGColor,ShowBlocks,Maximize,About';
	config.filebrowserBrowseUrl = 'ckfinder/ckfinder.html';
	config.filebrowserImageBrowseUrl = 'ckfinder/ckfinder.html?type=Images';
	config.filebrowserFlashBrowseUrl = 'ckfinder/ckfinder.html?type=Flash';
	config.filebrowserUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Files';
	config.filebrowserImageUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images';
	config.filebrowserFlashUploadUrl = 'ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash';

};
