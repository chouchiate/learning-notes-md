if (preg_match('/^GW[a-zA-Z0-9]{2}$/', $request->gateway_id)) {
            $gateway_id_array = str_split(substr($request->gateway_id, 2));
            $gateway_id = 'GW-' . implode('', array_map(function ($char) {
                return str_pad(dechex(ord($char)), 2, '0', STR_PAD_LEFT);
            }, $gateway_id_array));
        } else {
            abort(201, 'Gateway ID 格式錯誤');
        }