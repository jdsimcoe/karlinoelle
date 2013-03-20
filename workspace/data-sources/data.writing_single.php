<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcewriting_single extends SectionDatasource{

		public $dsParamROOTELEMENT = 'writing-single';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$title';
		public $dsParamSORT = 'system:id';
		public $dsParamHTMLENCODE = 'yes';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';


		public $dsParamFILTERS = array(
				'1' => '{$title}',
		);


		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'content: formatted',
				'image: image',
				'image: caption',
				'verses: passage',
				'verses: content',
				'verses: version: abbreviation'
		);


		public function __construct($env=NULL, $process_params=true){
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Writing: Single',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://briansimcoe',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-01-29T22:34:02+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
