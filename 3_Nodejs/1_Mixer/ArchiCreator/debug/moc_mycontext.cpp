/****************************************************************************
** Meta object code from reading C++ file 'mycontext.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../mycontext.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mycontext.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MyContext_t {
    QByteArrayData data[14];
    char stringdata0[164];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MyContext_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MyContext_t qt_meta_stringdata_MyContext = {
    {
QT_MOC_LITERAL(0, 0, 9), // "MyContext"
QT_MOC_LITERAL(1, 10, 13), // "myElemChanged"
QT_MOC_LITERAL(2, 24, 0), // ""
QT_MOC_LITERAL(3, 25, 15), // "ElementCreator*"
QT_MOC_LITERAL(4, 41, 6), // "myElem"
QT_MOC_LITERAL(5, 48, 17), // "listOfElemChanged"
QT_MOC_LITERAL(6, 66, 15), // "QList<QObject*>"
QT_MOC_LITERAL(7, 82, 10), // "listOfElem"
QT_MOC_LITERAL(8, 93, 9), // "setMyElem"
QT_MOC_LITERAL(9, 103, 13), // "setListOfElem"
QT_MOC_LITERAL(10, 117, 15), // "sendActionToCpp"
QT_MOC_LITERAL(11, 133, 9), // "nomAction"
QT_MOC_LITERAL(12, 143, 9), // "parameter"
QT_MOC_LITERAL(13, 153, 10) // "parameter2"

    },
    "MyContext\0myElemChanged\0\0ElementCreator*\0"
    "myElem\0listOfElemChanged\0QList<QObject*>\0"
    "listOfElem\0setMyElem\0setListOfElem\0"
    "sendActionToCpp\0nomAction\0parameter\0"
    "parameter2"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MyContext[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       2,   76, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   49,    2, 0x06 /* Public */,
       5,    1,   52,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    1,   55,    2, 0x0a /* Public */,
       9,    1,   58,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      10,    3,   61,    2, 0x02 /* Public */,
      10,    2,   68,    2, 0x22 /* Public | MethodCloned */,
      10,    1,   73,    2, 0x22 /* Public | MethodCloned */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 6,    7,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 6,    7,

 // methods: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   11,   12,   13,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   11,   12,
    QMetaType::Void, QMetaType::QString,   11,

 // properties: name, type, flags
       4, 0x80000000 | 3, 0x0049510b,
       7, 0x80000000 | 6, 0x0049510b,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void MyContext::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->myElemChanged((*reinterpret_cast< ElementCreator*(*)>(_a[1]))); break;
        case 1: _t->listOfElemChanged((*reinterpret_cast< QList<QObject*>(*)>(_a[1]))); break;
        case 2: _t->setMyElem((*reinterpret_cast< ElementCreator*(*)>(_a[1]))); break;
        case 3: _t->setListOfElem((*reinterpret_cast< QList<QObject*>(*)>(_a[1]))); break;
        case 4: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 5: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: _t->sendActionToCpp((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< ElementCreator* >(); break;
            }
            break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< ElementCreator* >(); break;
            }
            break;
        case 3:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MyContext::*_t)(ElementCreator * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyContext::myElemChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (MyContext::*_t)(QList<QObject*> );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MyContext::listOfElemChanged)) {
                *result = 1;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< ElementCreator* >(); break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QObject*> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< ElementCreator**>(_v) = _t->getMyElem(); break;
        case 1: *reinterpret_cast< QList<QObject*>*>(_v) = _t->getListOfElem(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        MyContext *_t = static_cast<MyContext *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMyElem(*reinterpret_cast< ElementCreator**>(_v)); break;
        case 1: _t->setListOfElem(*reinterpret_cast< QList<QObject*>*>(_v)); break;
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
        return static_cast<void*>(const_cast< MyContext*>(this));
    return QObject::qt_metacast(_clname);
}

int MyContext::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MyContext::myElemChanged(ElementCreator * _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MyContext::listOfElemChanged(QList<QObject*> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
