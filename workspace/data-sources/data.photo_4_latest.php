<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcephoto_4_latest extends SectionDatasource{

		public $dsParamROOTELEMENT = 'photo-4-latest';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '4';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'80' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'image: image',
				'image: caption'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Photo: 4 Latest',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://briansimcoe',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-13T19:30:21+00:00'
			);
		}

		public function getSource(){
			return '15';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
