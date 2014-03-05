package PI::TrackerMessageParser;

use utf8;
use strict;
use warnings;
use Time::Piece;
use Math::BigInt;
use Geo::Coordinates::DecimalDegrees;

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
        reason_generator
    /;

    my %decimals;

    foreach my $index (@numbers) {
        my $number = eval("0x".$result{$index});

        $decimals{$index} = $number;

        if($index eq 'package_date') {
            $decimals{$index} = localtime($decimals{$index})->strftime('%F %T');
        }
    }

    my $sat_hdop                = &parse_sat_hdop($result{'satellite_hdop'});
    $result{'flag_status'}      = &parse_flag_status($result{'flag_status'});
    $result{'latitude'}         = &parse_lat_lng($result{'latitude'});
    $result{'longitude'}        = &parse_lat_lng($result{'longitude'});

    $result{'sat_number'}       = $sat_hdop->{sat};
    $result{'hdop'}             = $sat_hdop->{hdop};

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

    $value =~ /^(-?\d*)(\d{2})\.(\d{2})(\d+)$/;

    my $part = "$3";

    if ($part eq "00") {
        $part = "0";
    }

    my $point = dms2decimal("$1", "$2", "$part.$4");

    return $point;
}

sub parse_sat_hdop {
    my $str = &dec2bin(hex shift);
    $str    =~ s/^0+(?=\d)//;

    my @val = unpack("A4A4", $str);

    my $data = {
        sat   => &bin2dec($val[0]),
        hdop  => &bin2dec($val[1]),
    };

    return $data;
}

sub bin2dec {
    my $bin = shift;

    return unpack("N", pack("B32", substr("0" x 32 . $bin, -32)))
}

sub dec2bin {
    my $str = unpack("B32", pack("N", shift));
    $str    =~ s/^0+(?=\d)//;   # otherwise you'll get leading zeros

    return $str;
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
        reason_generator
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