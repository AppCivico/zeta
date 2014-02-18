package PI::TrackerMessageParser;

use utf8;
use strict;
use warnings;
use Time::Piece;
use Math::BigInt;
use DDP;

sub parser {
    my ( $message ) = @_;

    my @pack    = unpack("A4A2A16A2A2A4A2A4A4A2A8A8A8A2A2A8A6A2A2A2A2A2A8A4", $message);
    my %result  = &build_array(@pack, 0);

    my @numbers = qw /
        battery_voltage
        battery_voltage_bkp
        hourmeter
        imei
        message_size
        odometer
        package_date
        position_counter
        speed
        temperature
    /;

    my %decimals;

    foreach my $index (@numbers) {
        my $number = eval("0x".$result{$index});

        $decimals{$index} = $number;

        if($index eq 'package_date') {
            $decimals{$index} = localtime($decimals{$index})->strftime('%F %T');
        }
    }

    $result{'flag_status'}  = &parse_flag_status($result{'flag_status'});
    $result{'latitude'}     = &parse_lat_lng($result{'latitude'});
    $result{'longitude'}    = &parse_lat_lng($result{'longitude'});

    my %resp = (%result, %decimals);

    return %resp;
}

sub parse_flag_status {
    my $flag = shift;

    $flag = Math::BigInt->new(hex $flag)->as_bin;
#     p $flag;
}

sub parse_lat_lng {
    my $value   = shift;
    $value      = unpack 'f*', pack 'L', hex $value;

    return $value;
}

sub build_array {
    my @values = @_;

    my $size = @values;
    my $type = $values[$size -1];

    my @indexes = qw/
        header
        package_type
        imei
        pcb_version
        firmware_version
        message_size
        position_amount
        position_counter
        position_size
        generate_reason
        package_date
        latitude
        longitude
        satellite_hdop
        speed
        odometer
        hourmeter
        inputs
        outputs
        battery_voltage
        battery_voltage_bkp
        temperature
        flag_status
        crc
    /;

    my %result = ( map { $indexes[$_] => $type eq 'dec' ? hex : $values[$_] } 0 .. scalar @indexes -1 );

    return %result;
}

1;