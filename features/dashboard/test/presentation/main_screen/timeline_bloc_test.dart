import 'package:core/core.dart';
import 'package:dashboard/src/presentation/screens/timeline_screen/bloc/timeline_bloc.dart';
import 'package:dashboard/src/presentation/screens/timeline_screen/bloc/timeline_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('TimelineBloc', () {
    late MockLogger mockLogger;
    late TimelineBloc bloc;

    setUp(() {
      mockLogger = MockLogger();
      bloc = TimelineBloc(mockLogger);
    });

    test('Initial state is correct', () {
      expect(bloc.state, TimelineState.create());
    });

    test('Init', () {
      // Act
      bloc.init(parameter: const BlocNoParameter());

      // Assert
      verify(() => mockLogger.d('Init')).called(1);
    });

    test('Dispose', () {
      // Act
      bloc.dispose();

      // Assert
      verify(() => mockLogger.d('Dispose')).called(1);
    });
  });

  group('TimelineState', () {
    test('copyWith', () {
      final initialState = TimelineState.create();

      // Test with new status
      final newState = initialState.copyWith(status: TimelineStatus.initial);
      expect(newState.status, TimelineStatus.initial);

      // Test without changing status
      final sameState = initialState.copyWith();
      expect(sameState.status, TimelineStatus.initial);
    });

    test('props', () {
      final initialState = TimelineState.create();
      expect(initialState.props, [TimelineStatus.initial]);
    });
  });
}
