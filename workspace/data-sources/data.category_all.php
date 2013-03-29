<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecategory_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'category-all';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';
		

		public $dsParamFILTERS = array(
				'87' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description'
		);
		

		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Category: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://karlinoelle',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-29T18:31:44+00:00'
			);
		}

		public function getSource(){
			return '16';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
