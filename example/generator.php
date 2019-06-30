<?php
    class Nums
    {
        private $result;

        public function __constructor()
        {
            $this->result = 0;
        }

        public function getInput($start = 0, $end = 352313)
        {
            $a = rand($start, $end);
            $b = rand($start, $end);
            $this->result = $a + $b;
            return "$a $b";
        }

        public function getResult()
        {
            return $this->result;
        }
    }


    for ($i = 0; $i < 1000; $i++) {
        $file_name = str_pad($i, 4, 0, STR_PAD_LEFT);

        $nums = new Nums();
        $inputFile = fopen("/var/www/c-tester/example/input/mytests/$file_name.in", "w") or die("Unable to open file!");
        fwrite($inputFile, $nums->getInput());
        fclose($inputFile);
        print_r("$file_name.in ok\n");
        $correctOutputFile = fopen("/var/www/c-tester/example/correct-output/mytests/$file_name.out", "w") or die("Unable to open file!");
        fwrite($correctOutputFile, $nums->getResult()."\n");
        fclose($correctOutputFile);
        print_r("$file_name.out ok\n");
    }
