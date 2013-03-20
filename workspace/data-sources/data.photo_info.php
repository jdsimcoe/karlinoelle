<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcephoto_info extends DynamicXMLDatasource{

		public $dsParamROOTELEMENT = 'photo-info';
		public $dsParamURL = '{$root}/extensions/image_info/service.php?section=images&entries={$ds-photo-single.image}&field_name=image&iptc=false';
		public $dsParamXPATH = '/';
		public $dsParamCACHE = '30';
		public $dsParamTIMEOUT = '6';
		

		

		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-photo-single.image');
		}

		public function about(){
			return array(
				'name' => 'Photo: Info',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://briansimcoe',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-13T19:57:33+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
