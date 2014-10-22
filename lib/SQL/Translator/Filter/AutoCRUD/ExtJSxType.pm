package SQL::Translator::Filter::AutoCRUD::ExtJSxType;
{
  $SQL::Translator::Filter::AutoCRUD::ExtJSxType::VERSION = '2.113270';
}

use strict;
use warnings FATAL => 'all';

my %xtype_for = (
    boolean => 'checkbox',
);

$xtype_for{$_} = 'numberfield' for (
    'bigint',
    'bigserial',
    'dec',
    'decimal',
    'double precision',
    'float',
    'int',
    'integer',
    'mediumint',
    'money',
    'numeric',
    'real',
    'smallint',
    'serial',
    'tinyint',
    'year',
);

$xtype_for{$_} = 'timefield' for (
    'time',
    'time without time zone',
    'time with time zone',
);

$xtype_for{$_} = 'datefield' for (
    'date',
);

$xtype_for{$_} = 'xdatetime' for (
    'datetime',
    'timestamp',
    'timestamp without time zone',
    'timestamp with time zone',
);

sub filter {
    my ($schema, @args) = @_;

    foreach my $tbl ($schema->get_tables) {
        # set extjs_xtype on fieldumns
        foreach my $field ($tbl->get_fields) {
            if (exists $xtype_for{ lc $field->data_type }) {
                $field->extra(extjs_xtype => $xtype_for{ lc $field->data_type });
            }
            elsif (scalar $field->size <= 40) {
                $field->extra(extjs_xtype => 'textfield');
            }
            else {
                $field->extra(extjs_xtype => 'textarea');
            }
        }
    }
}

1;
