<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceblog_latest extends SectionDatasource{

		public $dsParamROOTELEMENT = 'blog-latest';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'21' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'date',
				'content: formatted',
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
				'name' => 'Blog: Latest',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://karlinoelle',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-03-20T20:24:52+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
