<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceartwork_3_latest extends SectionDatasource{

		public $dsParamROOTELEMENT = 'artwork-3-latest';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '4';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'81' => 'no',
				'79' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'image: image',
				'image: caption',
				'media: title',
				'medium: title',
				'dimensions'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Artwork: 3 Latest',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://briansimcoe',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-20T05:43:54+00:00'
			);
		}

		public function getSource(){
			return '13';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
