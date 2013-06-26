perl script/pi_create.pl model DB DBIC::Schema PI::Schema create=static components=TimeStamp,PassphraseColumn 'dbi:Pg:dbname=pi;host=localhost' postgres system quote_names=1 overwrite_modifications=1

rm lib/PI/Model/DB.pm.new;
rm t/model_DB.t.new;
