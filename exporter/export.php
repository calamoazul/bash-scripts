<?php

/**
 * Clase para exportar datos de una ApiRest en excel
 */
class Exporter 
{
    protected string $url;
    protected string $output;


    public function __construct(string $url, string $output)
    {
        $this->url = $url;
        $this->output = $output;
    }

    /**
     * Función para obtener los datos de url
     * @throws Exception
     * @return string
     */
    private function get_data():string
    {
        /**
         * @var array $options
         * Opciones pasadas a la request
         */
        $options = [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_CONNECTTIMEOUT => 30,
            CURLOPT_TIMEOUT => 300,
            CURLOPT_MAXREDIRS => 5,
        ];
   
   
        /**
         * Se realiza la petición y se cierra tras obtener los datos
         */
        $ch = curl_init($this->url);
        curl_setopt_array($ch, $options);

        
        /**
         * @var string Respuesta de la petición
         */
        $response = curl_exec($ch);
       
        /**
         * @var int Código de respuesta de la petición
         */
        $http_status = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);

        /**
         * Si el código no es una repuesta de éxito el script devuelve un error
         */
        
        if( $http_status < 200 || $http_status >= 300):
            throw new Exception('La ruta escogida da un código de error', $http_status);
        endif;

        /**
         * Se devuelve la respuesta de la api
         */
        return $response;
    }

    /**
     * Decodifica los aarrays en json
     *
     * @param array|string $value
     * @return string
     */
    private function decode(array|string $value):string
    {
        if(is_array($value)):
           $value = json_encode($value);
        endif;
        return $value;
        
    }
    /**
     * Método para exportar los datos en excel
     *
     * @return boolean
     */
    public function export():bool
    {
        /**
         * Se obtienen los datos y se transforman en un array
         */
        $response = $this->get_data();

        $data = json_decode($response, true);
     
        $columns = array_keys($data);
        
        $values = array_map(fn($value) => $this->decode($value), array_values($data));

     

        /** 
         * Se crea el archivo excel según la ruta dada por el usuario
         */
        $excel = fopen($this->output, 'w');

        /**
         * Se rellena el excel
         */
        fputcsv($excel, $columns, ",");
        
        fputcsv($excel, $values);
        fclose($excel);

        /**
         * Respuesta del script
         */
        return true;
    }

 
}

/**
 * @var string Primer argumento recibido del script
 */
$url = $argv[1];

/**
 * @var string Segundo argumento recibido del script
 */

$output = $argv[2];

/**
 * Ejecución del script
 */

$exporter = new Exporter($url, $output);
$exporter->export();

