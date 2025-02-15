{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rLevel1",
  "isDnd": false,
  "volume": 1.0,
  "parentRoom": null,
  "views": [
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":64,"hview":64,"xport":0,"yport":0,"wport":640,"hport":640,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":64,"hview":64,"xport":640,"yport":0,"wport":640,"hport":640,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
    {"inherit":false,"visible":false,"xview":0,"yview":0,"wview":1366,"hview":768,"xport":0,"yport":0,"wport":1366,"hport":768,"hborder":32,"vborder":32,"hspeed":-1,"vspeed":-1,"objectId":null,},
  ],
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lMain","instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"iGoal","properties":[],"isDnd":false,"objectId":{"name":"oGoal","path":"objects/oGoal/oGoal.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":40.0,"y":32.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5DDE2DCA","properties":[],"isDnd":false,"objectId":{"name":"oRobot","path":"objects/oRobot/oRobot.yy",},"inheritCode":false,"hasCreationCode":false,"colour":4294967295,"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"imageIndex":0,"imageSpeed":1.0,"inheritedItemId":null,"frozen":false,"ignore":false,"inheritItemSettings":false,"x":16.0,"y":32.0,},
      ],"visible":true,"depth":0,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":8,"gridY":8,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lObstacles","tilesetId":{"name":"tsCanyon","path":"tilesets/tsCanyon/tsCanyon.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":8,"SerialiseHeight":8,"TileCompressedData":[
-5,-2147483648,1,0,-7,-2147483648,1,0,
-7,-2147483648,1,0,-5,-2147483648,-3,0,
-4,-2147483648,-6,0,-3,-2147483648,-4,0,
-4,-2147483648,-3,0,-5,-2147483648,-3,0,
-2,-2147483648,],},"visible":true,"depth":100,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lOverlay","tilesetId":{"name":"tsCanyon","path":"tilesets/tsCanyon/tsCanyon.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":8,"SerialiseHeight":8,"TileCompressedData":[
-4,-2147483648,-2,0,-6,-2147483648,-3,0,
-5,-2147483648,6,0,-2147483648,0,0,-2147483648,
-2147483648,-3,0,2,-2147483648,0,-3,-2147483648,
-5,0,-3,-2147483648,-5,0,1,-2147483648,
-8,0,-2,-2147483648,-4,0,-2,-2147483648,
],},"visible":true,"depth":200,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lGroundDecor","tilesetId":{"name":"tsCanyon","path":"tilesets/tsCanyon/tsCanyon.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":8,"SerialiseHeight":8,"TileCompressedData":[
-12,-2147483648,-2,0,-6,-2147483648,-4,0,
-4,-2147483648,-14,0,-2,-2147483648,-3,0,
1,-2147483648,-7,0,6,-2147483648,0,-2147483648,
-2147483648,0,0,-3,-2147483648,],},"visible":true,"depth":300,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lGround","tilesetId":{"name":"tsCanyon","path":"tilesets/tsCanyon/tsCanyon.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":8,"SerialiseHeight":8,"TileCompressedData":[
-13,-2147483648,1,0,-6,-2147483648,-4,0,
-4,-2147483648,-4,0,8,-2147483648,0,1,
2,2,3,0,-2147483648,-6,0,-2,
-2147483648,-6,0,-2,-2147483648,-2,0,-6,
-2147483648,],},"visible":true,"depth":400,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"lDeath","instances":[],"visible":true,"depth":500,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"lDecor","tilesetId":{"name":"tsCanyon","path":"tilesets/tsCanyon/tsCanyon.yy",},"x":0,"y":0,"tiles":{"TileDataFormat":1,"SerialiseWidth":8,"SerialiseHeight":8,"TileCompressedData":[
-26,-2147483648,-5,0,-4,-2147483648,-4,0,
-2,-2147483648,7,0,17,16,16,18,
0,-2147483648,-7,0,1,-2147483648,-3,0,
-5,-2147483648,],},"visible":true,"depth":600,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","spriteId":null,"colour":4278190080,"x":0,"y":0,"htiled":false,"vtiled":false,"hspeed":0.0,"vspeed":0.0,"stretch":false,"animationFPS":15.0,"animationSpeedType":0,"userdefinedAnimFPS":false,"visible":true,"depth":700,"userdefinedDepth":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritVisibility":true,"inheritSubLayers":true,"gridX":32,"gridY":32,"layers":[],"hierarchyFrozen":false,"effectEnabled":true,"effectType":null,"properties":[],},
  ],
  "inheritLayers": false,
  "creationCodeFile": "rooms/rLevel1/RoomCreationCode.gml",
  "inheritCode": false,
  "instanceCreationOrder": [
    {"name":"iGoal","path":"rooms/rLevel1/rLevel1.yy",},
    {"name":"inst_5DDE2DCA","path":"rooms/rLevel1/rLevel1.yy",},
  ],
  "inheritCreationOrder": false,
  "sequenceId": null,
  "roomSettings": {
    "inheritRoomSettings": false,
    "Width": 64,
    "Height": 64,
    "persistent": false,
  },
  "viewSettings": {
    "inheritViewSettings": false,
    "enableViews": false,
    "clearViewBackground": true,
    "clearDisplayBuffer": true,
  },
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "parent": {
    "name": "levels",
    "path": "folders/Rooms/levels.yy",
  },
}