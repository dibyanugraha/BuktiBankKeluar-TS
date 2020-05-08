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

            trigger OnValidate()
            begin
                if No <> xRec.No then begin
                    PurchSetup.Get;
                    NoSeriesMgt.TestManual(PurchSetup.BuktiBankKeluarNos);
                    NoSeries := '';
                end;
            end;
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
            TableRelation = "Bank Account";

            trigger OnValidate()
            var
                BankAcc: Record "Bank Account";
            begin
                if BankNo <> '' then begin
                    BankAcc.Get(BankNo);
                    BankName := BankAcc.Name;
                end;
            end;
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
        field(11; Status; Enum "Purchase Document Status")
        {
            DataClassification = CustomerContent;
            Editable = false; // bikin jadi readonly
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

    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        DocumentDate := WorkDate();

        if No = '' then begin
            PurchSetup.Get;
            PurchSetup.TestField(BuktiBankKeluarNos);
            NoSeriesMgt.InitSeries(PurchSetup.BuktiBankKeluarNos, xRec.NoSeries, DocumentDate, No, NoSeries);
        end;
    end;

    procedure AssistEdit(OldBbk: Record xts_BuktiBankKeluarHeader): Boolean
    var
        bbk: Record xts_BuktiBankKeluarHeader;
    begin
        with bbk do begin
            bbk := Rec;
            PurchSetup.Get;
            PurchSetup.TestField(BuktiBankKeluarNos);
            if NoSeriesMgt.SelectSeries(PurchSetup.BuktiBankKeluarNos, OldBbk.NoSeries, NoSeries) then begin
                NoSeriesMgt.SetSeries(No);
                Rec := bbk;
                exit(true);
            end;
        end;
    end;
}