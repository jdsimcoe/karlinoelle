<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcephoto_featured extends SectionDatasource{

		public $dsParamROOTELEMENT = 'photo-featured';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'82' => 'yes',
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
				'name' => 'Photo: Featured',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://karlinoelle',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-20T20:30:29+00:00'
			);
		}

		public function getSource(){
			return '15';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
