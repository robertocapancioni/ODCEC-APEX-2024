
--select nel plugin kanmab
SELECT   
   ID,
ATTIVITA AS TITLE,
    stato_ID AS COLUMN_ID
    from d27_ATTIVITA;

{
    "refresh": 0,
    "staticColumns": [{
        "COLUMN_ID": "1",
        "COLUMN_TITLE": "Aperto",
        "COLUMN_ICON": "fa-calendar"
                        }, {
        "COLUMN_ID": "2",
        "COLUMN_TITLE": "In Sospeso",
        "COLUMN_ICON": "fa-wrench"
                        }, {
        "COLUMN_ID": "4",
        "COLUMN_TITLE": "In Attesa",
        "COLUMN_ICON": "fa-compass"},{
        "COLUMN_ID": "3",
        "COLUMN_TITLE": "Chiuso",
        "COLUMN_ICON": "fa-check"
    }],
    "dynamicColumns": false,
    "groupExtension": false,
    "groupColWidth": 6,
    "allowDragItemsBetweenGroups": false,
    "groupCollapsible": false,
    "printDataToConsole": false
}

-- codice per il plsql del plugin kanban
DECLARE
    VR_ITEM_ID VARCHAR2(200) := :APEX$ITEM_ID;
    VR_OLD_GROUP_ID VARCHAR2(200) := :APEX$OLD_GROUP_ID;
    VR_OLD_COLUMN_ID VARCHAR2(200) := :APEX$OLD_COLUMN_ID;
    VR_OLD_INDEX VARCHAR2(200) := :APEX$OLD_INDEX;
    VR_NEW_GROUP_ID VARCHAR2(200) := :APEX$NEW_GROUP_ID;
    VR_NEW_COLUMN_ID VARCHAR2(200) := :APEX$NEW_COLUMN_ID;
    VR_NEW_INDEX VARCHAR2(200) := :APEX$NEW_INDEX;
BEGIN
    APEX_DEBUG.MESSAGE ( 'moved item ' ||
                        VR_ITEM_ID || ' from ' ||
                        VR_OLD_GROUP_ID || '/' ||
                        VR_OLD_COLUMN_ID || '/' ||
                        VR_OLD_INDEX|| ' to ' ||
                        VR_NEW_GROUP_ID || '/' ||
                        VR_NEW_COLUMN_ID || '/' ||
                        VR_NEW_INDEX
                    );
    update d27_attivita set stato_id = :APEX$NEW_COLUMN_ID
    where id = :APEX$ITEM_ID;
    --Raise_Application_Error (-20001, 'my error');                   
END;



-- select list nella hom dell'applicativo kanban
select distinct progetto D,progetto R from d27_attivita order by 1
