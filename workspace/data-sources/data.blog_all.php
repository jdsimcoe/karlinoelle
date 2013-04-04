<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceblog_all extends SectionDatasource{

		public $dsParamROOTELEMENT = 'blog-all';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '24';
		public $dsParamSTARTPAGE = '{$title}';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'21' => 'no',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'title',
				'date',
				'content: formatted',
				'image: image',
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
				'name' => 'Blog: All',
				'author' => array(
					'name' => 'Jonathan Simcoe',
					'website' => 'http://karlinoelle',
					'email' => 'jdsimcoe@gmail.com'),
				'version' => 'Symphony 2.3.1',
				'release-date' => '2013-04-02T20:56:19+00:00'
			);
		}

		public function getSource(){
			return '1';
		}

		public function allowEditorToParse(){
			return true;
		}

	}
