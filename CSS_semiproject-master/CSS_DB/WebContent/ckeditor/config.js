/**
 * @license Copyright (c) 2003-2018, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config )

{

        config.docType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">';

        config.font_defaultLabel = '굴림';

        config.font_names = '굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Tahoma/Tahoma;Verdana/Verdana';

        config.fontSize_defaultLabel = '12px';

        config.fontSize_sizes = '8/8px;9/9px;10/10px;11/11px;12/12px;14/14px;16/16px;18/18px;20/20px;22/22px;24/24px;26/26px;28/28px;36/36px;48/48px;';

        config.language = "ko";

        config.resize_enabled = true;                           // 사이즈 변경

        config.enterMode = CKEDITOR.ENTER_BR;           // 에디터상에서 엔터입력시 <br />로 적용

        config.shiftEnterMode = CKEDITOR.ENTER_P;      // shift + enter 시 <p> 로 적용

        config.startupFocus = true;                                     // 시작시 포커스 설정

        /*config.uiColor = '#E5FAF5';*/
        
        config.extraPlugins = 'autogrow';
        
        config.autoGrow_minHeight = 200;
        
        config.uiColor = '#E5FAF5';
        
        config.autoGrow_maxHeight = 450;
        
        config.autoGrow_bottomSpace = 50;
        
        config.autoGrow_onStartup = true;
        
        config.toolbarCanCollapse = false;                      // 툴바 클릭시 접히는 여부

        config.menu_subMenuDelay = 0;                           // 메뉴 클릭시 딜레이값

        config.toolbar = 'Full';
        
        config.extraPlugins = 'wordcount,notification';
        
        config.wordcount = {

        		
        
        	    // Whether or not you want to show the Paragraphs Count
        	    showParagraphs: false,

        	    // Whether or not you want to show the Word Count
        	    showWordCount: false,

        	    // Whether or not you want to show the Char Count
        	    showCharCount: true,

        	    // Whether or not you want to count Spaces as Chars
        	    countSpacesAsChars: true,

        	    // Whether or not to include Html chars in the Char Count
        	    countHTML: false,
        	    
        	    // Maximum allowed Word Count, -1 is default for unlimited
        	    maxWordCount: -1,

        	    // Maximum allowed Char Count, -1 is default for unlimited
        	    maxCharCount: 333,
        	    
        	    

        	    // Add filter to add or remove element before counting (see CKEDITOR.htmlParser.filter), Default value : null (no filter)
        	    filter: new CKEDITOR.htmlParser.filter({
        	        elements: {
        	            div: function( element ) {
        	                if(element.attributes.class == 'mediaembed') {
        	                    return false;
        	                }
        	            }
        	        }
        	    })
        	};
        
      
};