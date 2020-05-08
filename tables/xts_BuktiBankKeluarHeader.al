// nama table
table 51000 xts_BuktiBankKeluarHeader
{
    DataClassification = CustomerContent;

    // daftar fields
    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; NoSeries; Code[10])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(3; DocumentDate; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(4; PostingDate; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; BankNo; Code[20])
        {
            Caption = 'Bank No.';
            DataClassification = CustomerContent;
        }
        field(6; BankName; Text[50])
        {
            Caption = 'Bank Name';
            DataClassification = CustomerContent;
        }
        field(7; Notes; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(8; ShortcutDimension1Code; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(9; ShortcutDimension2Code; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(10; DimensionSetID; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = CustomerContent;
        }
        field(11; Status; Enum xts_BuktiBankDocumentStatus)
        {
            DataClassification = CustomerContent;
        }
        field(12; TotalAmount; Decimal)
        {
            CalcFormula = sum (xts_BuktiBankKeluarLine."Remaining Amount"
                where(DocumentNo = field(No)));
            Caption = 'Total Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    // primary dan indeks
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}