import './processing_actions.dart';

bool processingReducer(bool processing, dynamic action) {
  return action is IsProcessing ? action.processing : processing;
}
