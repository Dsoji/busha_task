class BlockModel {
  String hash;
  int ver;
  int vinSz;
  int voutSz;
  int size;
  int weight;
  int fee;
  String relayedBy;
  int lockTime;
  int txIndex;
  bool doubleSpend;
  int time;
  int blockIndex;
  int blockHeight;
  List<Input> inputs;
  List<Output> out;

  BlockModel({
    required this.hash,
    required this.ver,
    required this.vinSz,
    required this.voutSz,
    required this.size,
    required this.weight,
    required this.fee,
    required this.relayedBy,
    required this.lockTime,
    required this.txIndex,
    required this.doubleSpend,
    required this.time,
    required this.blockIndex,
    required this.blockHeight,
    required this.inputs,
    required this.out,
  });

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    var inputsFromJson = json['inputs'] as List;
    List<Input> inputList =
        inputsFromJson.map((i) => Input.fromJson(i)).toList();

    var outFromJson = json['out'] as List;
    List<Output> outList = outFromJson.map((i) => Output.fromJson(i)).toList();

    return BlockModel(
      hash: json['hash'],
      ver: json['ver'],
      vinSz: json['vin_sz'],
      voutSz: json['vout_sz'],
      size: json['size'],
      weight: json['weight'],
      fee: json['fee'],
      relayedBy: json['relayed_by'],
      lockTime: json['lock_time'],
      txIndex: json['tx_index'],
      doubleSpend: json['double_spend'],
      time: json['time'],
      blockIndex: json['block_index'],
      blockHeight: json['block_height'],
      inputs: inputList,
      out: outList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hash': hash,
      'ver': ver,
      'vin_sz': vinSz,
      'vout_sz': voutSz,
      'size': size,
      'weight': weight,
      'fee': fee,
      'relayed_by': relayedBy,
      'lock_time': lockTime,
      'tx_index': txIndex,
      'double_spend': doubleSpend,
      'time': time,
      'block_index': blockIndex,
      'block_height': blockHeight,
      'inputs': inputs.map((i) => i.toJson()).toList(),
      'out': out.map((o) => o.toJson()).toList(),
    };
  }
}

class Input {
  int sequence;
  String witness;
  String script;
  int index;
  PrevOut prevOut;

  Input({
    required this.sequence,
    required this.witness,
    required this.script,
    required this.index,
    required this.prevOut,
  });

  factory Input.fromJson(Map<String, dynamic> json) {
    return Input(
      sequence: json['sequence'],
      witness: json['witness'],
      script: json['script'],
      index: json['index'],
      prevOut: PrevOut.fromJson(json['prev_out']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequence': sequence,
      'witness': witness,
      'script': script,
      'index': index,
      'prev_out': prevOut.toJson(),
    };
  }
}

class PrevOut {
  int type;
  bool spent;
  int value;
  List<SpendingOutpoint> spendingOutpoints;
  int n;
  int txIndex;
  String script;

  PrevOut({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
  });

  factory PrevOut.fromJson(Map<String, dynamic> json) {
    var spendingOutpointsFromJson = json['spending_outpoints'] as List;
    List<SpendingOutpoint> spendingOutpointList = spendingOutpointsFromJson
        .map((i) => SpendingOutpoint.fromJson(i))
        .toList();

    return PrevOut(
      type: json['type'],
      spent: json['spent'],
      value: json['value'],
      spendingOutpoints: spendingOutpointList,
      n: json['n'],
      txIndex: json['tx_index'],
      script: json['script'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'spent': spent,
      'value': value,
      'spending_outpoints': spendingOutpoints.map((i) => i.toJson()).toList(),
      'n': n,
      'tx_index': txIndex,
      'script': script,
    };
  }
}

class SpendingOutpoint {
  int txIndex;
  int n;

  SpendingOutpoint({
    required this.txIndex,
    required this.n,
  });

  factory SpendingOutpoint.fromJson(Map<String, dynamic> json) {
    return SpendingOutpoint(
      txIndex: json['tx_index'],
      n: json['n'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tx_index': txIndex,
      'n': n,
    };
  }
}

class Output {
  int type;
  bool spent;
  int value;
  List<dynamic> spendingOutpoints;
  int n;
  int txIndex;
  String script;
  String? addr;

  Output({
    required this.type,
    required this.spent,
    required this.value,
    required this.spendingOutpoints,
    required this.n,
    required this.txIndex,
    required this.script,
    this.addr,
  });

  factory Output.fromJson(Map<String, dynamic> json) {
    return Output(
      type: json['type'],
      spent: json['spent'],
      value: json['value'],
      spendingOutpoints: json['spending_outpoints'],
      n: json['n'],
      txIndex: json['tx_index'],
      script: json['script'],
      addr: json['addr'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'spent': spent,
      'value': value,
      'spending_outpoints': spendingOutpoints,
      'n': n,
      'tx_index': txIndex,
      'script': script,
      'addr': addr,
    };
  }
}
