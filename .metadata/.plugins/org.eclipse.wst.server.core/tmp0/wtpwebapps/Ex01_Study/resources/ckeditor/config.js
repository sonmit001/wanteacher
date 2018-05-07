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

        config.uiColor = '#FAB0BF';
        
        config.extraPlugins = 'autogrow';
        
        config.autoGrow_minHeight = 450;
        
        config.autoGrow_maxHeight = 650;
        
        config.autoGrow_bottomSpace = 50;
        
        config.autoGrow_onStartup = true;
        
        
      /*  config.filebrowserUploadUrl = ':/ckeditor/fileUpload.aspx');
      */  
          
        config.toolbarCanCollapse = false;                      // 툴바 클릭시 접히는 여부

        config.menu_subMenuDelay = 0;                           // 메뉴 클릭시 딜레이값

        config.toolbar = 'Full';
        
        config.filebrowserBrowseUrl = 'ckeditor/ckfinder/browse.php?opener=ckeditor&type=files';
        config.filebrowserImageBrowseUrl = 'ckeditor/ckfinder/browse.php?opener=ckeditor&type=images';
        config.filebrowserFlashBrowseUrl = 'ckeditor/ckfinder/browse.php?opener=ckeditor&type=flash';
        config.filebrowserUploadUrl = 'ckeditor/ckfinder/upload.php?opener=ckeditor&type=files';
        config.filebrowserImageUploadUrl = 'ckeditor/ckfinder/upload.php?opener=ckeditor&type=images';
        config.filebrowserFlashUploadUrl = 'ckeditor/ckfinder/upload.php?opener=ckeditor&type=flash';

};