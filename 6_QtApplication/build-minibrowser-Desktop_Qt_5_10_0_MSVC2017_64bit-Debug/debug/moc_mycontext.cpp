/****************************************************************************
** Meta object code from reading C++ file 'mycontext.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.10.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../minibrowser/cpp/mycontext.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mycontext.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.10.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MyContext_t {
    QByteArrayData data[22];
    char stringdata0[246];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MyContext_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MyContext_t qt_meta_stringdata_MyContext = {
    {
QT_MOC_LITERAL(0, 0, 9), // "MyContext"
QT_MOC_LITERAL(1, 10, 13), // "myTrekChanged"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 5), // "Trek*"
QT_MOC_LITERAL(4, 31, 6), // "myTrek"
QT_MOC_LITERAL(5, 38, 19), // "errorMessageChanged"
QT_MOC_LITERAL(6, 58, 12), // "errorMessage"
QT_MOC_LITERAL(7, 71, 15), // "trekListChanged"
QT_MOC_LITERAL(8, 87, 15), // "QList<QObject*>"
QT_MOC_LITERAL(9, 103, 8), // "trekList"
QT_MOC_LITERAL(10, 112, 9), // "setMyTrek"
QT_MOC_LITERAL(11, 122, 15), // "setErrorMessage"
QT_MOC_LITERAL(12, 138, 11), // "setTrekList"
QT_MOC_LITERAL(13, 150, 15), // "sendActionToCpp"
QT_MOC_LITERAL(14, 166, 9), // "nomAction"
QT_MOC_LITERAL(15, 176, 9), // "parameter"
QT_MOC_LITERAL(16, 186, 10), // "parameter2"
QT_MOC_LITERAL(17, 197, 10), // "updateTrek"
QT_MOC_LITERAL(18, 208, 8), // "latitude"
QT_MOC_LITERAL(19, 217, 9), // "longitude"
QT_MOC_LITERAL(20, 227, 9), // "startTrek"
QT_MOC_LITERAL(21, 237, 8) // "trekName"

    },
    "MyContext\0myTrekChanged\0\0Trek*\0myTrek\0"
    "errorMessageChanged\0errorMessage\0"
    "trekListChanged\0QList<QObject*>\0"
    "trekList\0setMyTrek\0setErrorMessage\0"
    "setTrekList\0sendActionToCpp\0nomAction\0"
    "parameter\0parameter2\0updateTrek\0"
    "latitude\0longitude\0startTrek\0trekName"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MyContext[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       3,  114, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   69,    2, 0x06 /* Public */,
       5,    1,   72,    2, 0x06 /* Public */,
       7,    1,   75,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      10,    1,   78,    2, 0x0a /* Public */,
      11,    1,   81,    2, 0x0a /* Public */,
      12,    1,   84,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      13,    3,   87,    2, 0x02 /* Public */,
      13,    2,   94,    2, 0x22 /* Public | MethodCloned */,
      13,    1,   99,    2, 0x22 /* Public | MethodCloned */,
      17,    2,  102,    2, 0x02 /* Public */,
      20,    3,  107,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, QMetaType::QString,    6,
    QMetaType::Void, 0x80000000 | 8,    9,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, QMetaType::QString,    6,
    QMetaType::Void, 0x80000000 | 8,    9,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   14,   15,   16,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   14,   15,
    QMetaType::Void, QMetaType::QString,   14,
    QMetaType::Void, QMetaType::Double, QMetaType::Double,   18,   19,
    QMetaType::Void, QMetaType::QString, QMetaType::Double, QMetaType::Double,   21,   18,   19,

 // properties: name, type, flags
       4, 0x80000000 | 3, 0x0049510b,
       9, 0x80000000 | 8, 0x0049510b,
       6, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       2,
       1,

       0        // eod
};

void MyContext::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->myTrekChanged((*reinterpret_cast< Trek*(*)>(_a[1]))); break;
        case 1: _t->errorMessageChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->trekListChanged((*reinterpret_cast< QList<QObject*>(*)>(_a[1]))); break;
        case 3: _t->setMyTrek((*reinterpret_cast< Trek*(*)>(_a[1]))); break;
        case 4: _t->setErrorMessage((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->setTrekList((*reinterpret_cast< QList<QObject*>(*)>(_a[1]))); break;
        case 6: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 7: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 8: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 9: _t->updateTrek((*reinterpret_cast< const double(*)>(_a[1])),(*reinterpret_cast< const double(*)>(_a[2]))); break;
        case 10: _t->startTrek((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const double(*)>(_a[2])),(*reinterpret_cast< const double(*)>(_a[3]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Trek* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Trek* >(); break;
            }
            break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (MyContext::*_t)(Trek * );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MyContext::myTrekChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (MyContext::*_t)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MyContext::errorMessageChanged)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (MyContext::*_t)(QList<QObject*> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&MyContext::trekListChanged)) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Trek* >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< Trek**>(_v) = _t->getMyTrek(); break;
        case 1: *reinterpret_cast< QList<QObject*>*>(_v) = _t->getTrekList(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->errorMessage(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMyTrek(*reinterpret_cast< Trek**>(_v)); break;
        case 1: _t->setTrekList(*reinterpret_cast< QList<QObject*>*>(_v)); break;
        case 2: _t->setErrorMessage(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject MyContext::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MyContext.data,
      qt_meta_data_MyContext,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *MyContext::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MyContext::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MyContext.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MyContext::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MyContext::myTrekChanged(Trek * _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MyContext::errorMessageChanged(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void MyContext::trekListChanged(QList<QObject*> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
