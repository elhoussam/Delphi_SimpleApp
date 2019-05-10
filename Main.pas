unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Connection,
  Vcl.ComCtrls, Vcl.StdCtrls;

type
  TMyMainForm = class(TForm)
    MyDatePicker: TDateTimePicker;
    Label1: TLabel;
    CreditLbl: TLabel;
    DebitLbl: TLabel;
    DBGrid1: TDBGrid;
    SqlFilterBtn: TButton;
    SqlClearBtn: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    InfoLbl: TLabel;
    //procedure FilterBtnClick(Sender: TObject);
    //procedure ClearBtnClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure SqlClearBtnClick(Sender: TObject);
    procedure SqlFilterBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MyMainForm: TMyMainForm;

implementation

{$R *.dfm}


// My Own function
// input : string which contain [Credit , Debit] : name of field
// functionality :walkthrough every element in this column and collect values
// output : the total of ( Credit or Debit ) according to the applied filter
function GetTotalOf(thisColumn:string ):double ;
var i  : integer ;
total : double ; // contain the final result
begin
  total := 0 ;
  MyDataModule.MyQuery.DisableControls ;  // disable any external operation
 MyDataModule.MyQuery.First ;            // select the first element in the table
  while not( MyDataModule.MyQuery.Eof ) do// walkthrought every element & collect values
  begin
    total := total + MyDataModule.MyQuery.FieldByName( thisColumn ).AsFloat ;
    MyDataModule.MyQuery.Next ;       // step up into the next element
  end;
  MyDataModule.MyQuery.EnableControls ;
  Result := total ; // return the total as result
end;

procedure TMyMainForm.DBGrid1TitleClick(Column: TColumn);
var  str : string ;
{$J+}const PreviousColumnIndex : integer = -1;
const previousOrder : boolean = true ;
{$J-}
begin
   // ShowMessage( inttostr(PreviousColumnIndex)+'  '+inttostr(Column.Index));
  // Try bloc contain instr that remove the fsBold Style
  // from the previous column
    if PreviousColumnIndex <> -1  then begin
     DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
     DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
   end;

  // the following instr that add the fsBold Style
  // to the current column
   Column.title.Font.Style := Column.title.Font.Style + [fsBold];
   PreviousColumnIndex := Column.Index;

  // Construct the Query  by appending the column name with query
 str := 'SELECT * FROM mytbl ORDER BY '+Column.Field.FieldName   ;
 // if the PreviousOrder was true then append 'ASC'
 // Else append 'DESC'
 if previousOrder then begin
   str := str +' ASC' ;
 end
 else   begin
   str := str +' DESC' ;
 end ;
 // switching the value of the var (previousOrder)
 // to flip the order 'ASC' <-> 'DESC'
 previousOrder := not previousOrder  ;
 // apply the query that was constructed in the last steps
 MyDataModule.MyQuery.Close ;
 MyDataModule.MyQuery.SQL.Clear  ;
 MyDataModule.MyQuery.SQL.Add( str );
 MyDataModule.MyQuery.Open ;

 end;

procedure TMyMainForm.SqlClearBtnClick(Sender: TObject);
begin
  // clear the label caption
  DebitLbl.Caption := '';
  CreditLbl.Caption := '';
  // disable the date filter
  MyDataModule.MyQuery.Filtered := false ;
  MyDataModule.MyQuery.Filter := '' ;
  MyDataModule.MyQuery.Filtered := true ;

  InfoLbl.Caption  := 'Result : '+inttostr( MyDataModule.MyQuery.RecordCount )+' rows' ;
end;

procedure TMyMainForm.SqlFilterBtnClick(Sender: TObject);
var
  date : TDate ;
begin
  // extract the selected date from date picker
  date := MyDatePicker.Date ;
  // Put the filter of date
  MyDataModule.MyQuery.Filtered := false ;
  MyDataModule.MyQuery.Filter := 'Dt = {d ' + (FormatDateTime('yyyy-mm-dd', date))+'}' ;
  MyDataModule.MyQuery.Filtered := true ;
  // ShowMessage( MyDataModule.MyQuery.Filter );
  // set new values for the Credit and Debit label
  CreditLbl.Caption :=  FloatToStr( GetTotalOf('Credit') ) ;
  DebitLbl.Caption :=  FloatToStr( GetTotalOf('Debit') ) ;
  InfoLbl.Caption  := 'Result : '+inttostr( MyDataModule.MyQuery.RecordCount )+' rows' ;


end;

end.
