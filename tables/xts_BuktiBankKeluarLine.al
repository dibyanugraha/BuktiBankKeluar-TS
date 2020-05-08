table 51001 xts_BuktiBankKeluarLine
{
    DataClassification = CustomerContent;
    Caption = 'Bukti Bank Keluar Line';

    fields
    {
        // primary key: documentno, "Entry No."
        field(2; DocumentNo; Code[20])
        {
            Caption = 'Bukti Bank Keluar Document No.';
            DataClassification = CustomerContent;
        }
        field(60000; LineNo; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            TableRelation = "Vendor Ledger Entry";

            trigger OnValidate()
            var
                VLE: Record "Vendor Ledger Entry";
                Vend: Record Vendor;
            begin
                if "Entry No." <> 0 then begin
                    VLE.Get("Entry No.");
                    Vend.Get(VLE."Vendor No.");
                    TransferFields(VLE);

                    // isi amount dan remaining amount
                    VLE.CalcFields(Amount, "Remaining Amount");
                    "Amount" := VLE."Amount";
                    "Remaining Amount" := VLE."Remaining Amount";

                    // isi vendor name
                    "Vendor Name" := Vend.Name;
                end;
            end;
        }
        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(5; "Document Type"; Enum "Gen. Journal Document Type")
        {
            Caption = 'Document Type';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Vendor Document No.';
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(8; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(11; "Currency Code"; Code[10])
        {
            Caption = 'Currency Code';
            TableRelation = Currency;
        }
        field(50000; Amount; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(50001; "Remaining Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
        }
        field(50002; "Original Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(50003; "Remaining Amt. (LCY)"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(50004; "Amount (LCY)"; Decimal)
        {
            AutoFormatType = 1;
        }
        field(23; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(24; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
    }

    keys
    {
        // primary key, sekaligus index pertama
        key(PrimaryKey; DocumentNo, LineNo)
        {
            Clustered = true;
        }

        // index kedua
        key(Index01; "Vendor No.", "Posting Date")
        {

        }
    }
}